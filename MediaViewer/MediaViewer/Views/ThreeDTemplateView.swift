import SceneKit
import SceneKit.ModelIO
import SwiftUI

struct ThreeDTemplateView: View {
    var source: String
    var fileExtension: String?
    var allowXRotation: Bool? = true
    var allowYRotation: Bool? = true
    var autoRotate: Bool? = false
    var autoRotateDirection: [Float] = [1.0, 0.0, 0.0]
    @State private var myError: MyError?
    @EnvironmentObject var mediaState: MediaState
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @State private var isImmersiveSpaceOpen = false
    @State private var modelUrl: URL?

    var body: some View {
        ZStack {
            VStack {
                if source.hasPrefix("http"), let url = modelUrl {
                    SceneKitView(
                        modelUrl: url,
                        allowXRotation: allowXRotation,
                        allowYRotation: allowYRotation,
                        autoRotate: autoRotate,
                        autoRotateDirection: autoRotateDirection,
                        myError: $myError
                    )
                } else if !source.hasPrefix("http"), let fileExtension = fileExtension, let url = getFilePath(fileName: source, fileExtension: fileExtension) {
                    SceneKitView(
                        modelUrl: url,
                        allowXRotation: allowXRotation,
                        allowYRotation: allowYRotation,
                        autoRotate: autoRotate,
                        autoRotateDirection: autoRotateDirection,
                        myError: $myError
                    )
                } else {
                    ProgressView().progressViewStyle(CircularProgressViewStyle()).scaleEffect(2, anchor: .center).padding().frame(maxWidth: .infinity, maxHeight: .infinity)
                }

                let buttonMessage = isImmersiveSpaceOpen ? "Close 3D View" : "View in 3D"
                Button(buttonMessage) {
                    Task {
                        if isImmersiveSpaceOpen {
                            await dismissImmersiveSpace()
                            isImmersiveSpaceOpen.toggle()
                        } else {
                            if source.hasPrefix("http") {
                                mediaState.modelType = "URL"
                                mediaState.modelUrl = modelUrl
                            } else {
                                mediaState.modelType = "NAME"
                                mediaState.modelName = source
                            }
                            await openImmersiveSpace(id: "preview")
                            isImmersiveSpaceOpen.toggle()
                        }
                    }
                }
                .buttonBorderShape(.roundedRectangle)
                .buttonStyle(.bordered)
                .background(isImmersiveSpaceOpen ? Color.red : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
            }
        }.onAppear {
            Task {
                if source.hasPrefix("http") {
                    do {
                        let newModelUrl = try await getURL()
                        DispatchQueue.main.async {
                            modelUrl = newModelUrl
                        }
                    } catch let error as MyError {
                        DispatchQueue.main.async {
                            myError = MyError(error: error, title: "Error displaying 3D model")
                            print(myError!.toString())
                        }
                    }
                }
            }
        }
        .errorAlert(myError)
    }

    func getFilePath(fileName: String, fileExtension: String) -> URL? {
        let bundles = Bundle.allBundles
        for bundle in bundles {
            if let path = bundle.url(forResource: fileName, withExtension: fileExtension) {
                return path
            }
        }
        return nil
    }

    func downloadUSDZ(from url: URL, to destination: URL, fileExtension: String?) async throws -> URL {
        let semaphore = DispatchSemaphore(value: 0)
        var downloadLocation: URL?
        var taskError: Error?

        let task = URLSession.shared.downloadTask(with: URLRequest(url: url, timeoutInterval: 10)) { location, response, error in
            defer { semaphore.signal() }

            if let error = error {
                taskError = MyError(message: error.localizedDescription, title: "Couldn't download the 3D model file from \(url.absoluteString)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200 ... 299).contains(httpResponse.statusCode) else {
                taskError = MyError.basic("Invalid server response.")
                return
            }

            do {
                var destinationUrl = destination.appendingPathComponent(url.lastPathComponent)
                if let fileExtension = fileExtension {
                    destinationUrl = destinationUrl.deletingPathExtension().appendingPathExtension(fileExtension)
                }

                try? FileManager.default.removeItem(atPath: destinationUrl.path)
                try? FileManager.default.createDirectory(at: destinationUrl.deletingLastPathComponent(), withIntermediateDirectories: true, attributes: nil)

                if FileManager.default.fileExists(atPath: location!.path) {
                    // Verify file format (USDZ)
                    if let mimeType = httpResponse.mimeType, mimeType == "application/octet-stream" {
                        try FileManager.default.moveItem(atPath: location!.path, toPath: destinationUrl.path)
                        downloadLocation = destinationUrl
                    } else {
                        taskError = MyError.basic("The MIME Type of the url is invalid. Received: \(String(describing: httpResponse.mimeType)). Expected: application/octet-stream")
                    }
                } else {
                    taskError = MyError.basic("Downloaded 3D model not found")
                }
            } catch {
                taskError = error
            }
        }

        task.resume()
        semaphore.wait()

        if let taskError = taskError {
            throw taskError
        } else if let downloadLocation = downloadLocation {
            return downloadLocation
        } else {
            throw MyError.basic("Unknown error during download")
        }
    }

    private func getURL() async throws -> URL {
        if source.hasPrefix("http") {
            let urlString = source.replacingOccurrences(of: "http://", with: "https://", range: source.range(of: "http://"))
            guard let httpsUrl = URL(string: urlString) else {
                throw MyError.basic("URL \(urlString) is invalid")
            }

            return try await downloadUSDZ(from: httpsUrl, to: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("3D-assets"), fileExtension: fileExtension)
        } else if let url = Bundle.main.url(forResource: source, withExtension: fileExtension) {
            return url
        } else {
            throw MyError.basic("Couldn't load local 3D model file from \(source).\(String(describing: fileExtension))")
        }
    }
}

class SceneCoordinator: NSObject, ObservableObject {
    var allowXRotation: Bool? = true
    var allowYRotation: Bool? = true
    var autoRotateDirection: [Float] = [1.0, 0.0, 0.0]
    private var autoRotateTimer: Timer?
    @Published var rotations: [Float] = [0.0, 0.0, 0.0]

    @objc func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: sender.view!)
        let x = Float(translation.x)
        let y = Float(-translation.y)
        let anglePanX = x * Float(Double.pi) / 180.0
        let anglePanY = y * Float(Double.pi) / 180.0

        switch sender.state {
        case .changed:
            if allowXRotation == true { rotations[0] = anglePanX }
            if allowYRotation == true { rotations[1] = anglePanY }
        case .ended:
            if allowXRotation == true { rotations[0] = anglePanX }
            if allowYRotation == true { rotations[1] = anglePanY }
        default:
            break
        }
    }

    @objc func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .recognized {
            resetRotations()
        }
    }

    func resetRotations() {
        rotations = [0.0, 0.0, 0.0]
        autoRotateTimer?.invalidate()
    }

    public func setupAutoRotation() {
        autoRotateTimer?.invalidate()
        autoRotateTimer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { [weak self] _ in
            self?.rotations[0] += 0.01 * self!.autoRotateDirection[0]
            self?.rotations[1] += 0.01 * self!.autoRotateDirection[1]
            self?.rotations[2] += 0.01 * self!.autoRotateDirection[2]
        }
    }
}

struct SceneKitView: UIViewRepresentable {
    @EnvironmentObject var mediaState: MediaState
    var modelUrl: URL
    var allowXRotation: Bool? = true
    var allowYRotation: Bool? = true
    var autoRotate: Bool? = false
    var autoRotateDirection: [Float] = [1.0, 0.0, 0.0]
    @StateObject private var coordinator = SceneCoordinator()
    @Binding var myError: MyError?

    func makeUIView(context: Context) -> SCNView {
        coordinator.allowXRotation = allowXRotation
        coordinator.allowYRotation = allowYRotation
        coordinator.autoRotateDirection = autoRotateDirection

        let sceneView = SCNView()
        sceneView.scene = SCNScene()
        sceneView.backgroundColor = UIColor.clear
        sceneView.layer.borderColor = UIColor.gray.cgColor
        sceneView.layer.borderWidth = 1.0
        sceneView.autoenablesDefaultLighting = true

        let scene = SCNScene()

        let mdlAsset = MDLAsset(url: modelUrl)
        mdlAsset.loadTextures()
        let modelMesh = SCNNode(mdlObject: mdlAsset.object(at: 0))

        let xRange = abs(Double(modelMesh.boundingBox.min.x) - Double(modelMesh.boundingBox.max.x))
        let yRange = abs(Double(modelMesh.boundingBox.min.y) - Double(modelMesh.boundingBox.max.y))
        let zRange = abs(Double(modelMesh.boundingBox.min.z) - Double(modelMesh.boundingBox.max.z))
        let biggestRange = max(xRange, yRange, zRange)

        // scale model
        let sizeInMeters = 500.0
        let scaleValue = sizeInMeters / biggestRange
        modelMesh.scale = SCNVector3(scaleValue, scaleValue, scaleValue)

        // add node from mdlAsset
        modelMesh.name = "modelMesh"
        scene.rootNode.addChildNode(modelMesh)

        // create and add a camera to the scene
        let camera = SCNCamera()
        camera.zFar = 1000
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 600)
        scene.rootNode.addChildNode(cameraNode)
        // set scene
        sceneView.scene = scene

        // add listeners
        if allowXRotation == true || allowYRotation == true {
            let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(SceneCoordinator.handlePanGesture(_:)))
            sceneView.addGestureRecognizer(panGesture)

            let doubleTapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(SceneCoordinator.handleDoubleTap(_:)))
            doubleTapGesture.numberOfTapsRequired = 2
            sceneView.addGestureRecognizer(doubleTapGesture)
        }

        if autoRotate == true { context.coordinator.setupAutoRotation() }

        return sceneView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {
        if let scene = uiView.scene {
            if let modelMesh = scene.rootNode.childNode(withName: "modelMesh", recursively: false) {
                modelMesh.eulerAngles.x = context.coordinator.rotations[1]
                modelMesh.eulerAngles.y = context.coordinator.rotations[0]
                modelMesh.eulerAngles.z = context.coordinator.rotations[2]
            }
        }
    }

    func makeCoordinator() -> SceneCoordinator {
        return coordinator
    }
}

#Preview {
    ThreeDTemplateView(source: "EarthClouds_1_12756", fileExtension: "usdz", allowXRotation: true, allowYRotation: true, autoRotate: false, autoRotateDirection: [0.5, 1.0, 0.5])
}

// earth globe (browsed)
// ThreeDTemplateView(source: "https://drive.google.com/uc?export=download&id=1Df9oH4YsS8ZDwdpH3AJNcBevRcC11JJz", fileExtension: "usda", allowXRotation: true, allowYRotation: true, autoRotate: false, autoRotateDirection: [0.5, 1.0, 0.5])

// earth (usda):
// ThreeDTemplateView(source: "https://drive.google.com/uc?export=download&id=1PQde8yv2VyhPceaJdoF3y13SEJ4PIXAf", fileExtension: "usda", allowXRotation: true, allowYRotation: true, autoRotate: false, autoRotateDirection: [0.5, 1.0, 0.5])
// earth (usdz):
// ThreeDTemplateView(source: "https://drive.google.com/uc?export=download&id=1galVsH4x7ilvPJabgdrmva6T5TCtLVpE", fileExtension: "usdz", allowXRotation: true, allowYRotation: true, autoRotate: false, autoRotateDirection: [0.5, 1.0, 0.5])

// astronaut (usdz)
// ThreeDTemplateView(source: "https://drive.google.com/uc?export=download&id=1ysna1EvbHqwpkBSAAXnunFHiFfUwxtmP", fileExtension: "usdz", allowXRotation: true, allowYRotation: true, autoRotate: false, autoRotateDirection: [0.5, 1.0, 0.5])

// mangrove (local):
// ThreeDTemplateView(source: "mangrove", fileExtension: "usdz", allowXRotation: true, allowYRotation: true, autoRotate: false, autoRotateDirection: [0.5, 1.0, 0.5])
// ThreeDTemplateView(source: "https://drive.google.com/uc?export=download&id=1j3hFHGudDyWRGdWl37FjPku1wXfQXkb4", fileExtension: "usdz", allowXRotation: true, allowYRotation: true, autoRotate: false, autoRotateDirection: [0.5, 1.0, 0.5])
