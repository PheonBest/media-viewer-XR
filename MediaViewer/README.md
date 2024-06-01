# MediaViewer app

**To configure:**
The MediaViewer app gets data from the CMS. Modify the connection settings:
Copy [Development.xcconfig.example](MediaViewer/MediaViewer/Development.xcconfig.example) to 'MediaViewer/MediaViewer/Development.xcconfig'

**Architecture:**

```bash
.
├── Assets # Local media
├── Assets.xcassets # Images
├── Components # Reusable UI components
│ ├── EnhancedVideoPlayer.swift # Custom video player
│ ├── Error.swift # Error model and view modifier
│ ├── ErrorView.swift # View an error
│ ├── FetchButton.swift # Button to query the CMS for media
│ ├── ImmersiveSceneButton.swift # Button to enter/exit the immersive space
│ ├── MediumBackground.swift # Background of the medium container
│ ├── MediumContainer.swift # Contains the medium header and content
│ ├── MediumContent.swift # Display a page of a medium
│ ├── MediumControls.swift # Left and right arrows to navigate through the media
│ ├── MediumHeader.swift # Display the title of a page
│ └── Sidebar.swift # Sidebar to navigate through the areas
├── Config.swift # Load environment variables from the plist file
├── ContentView.swift # Main view. Contains the medium background, container and controls
├── Development.xcconfig # Environment variables
├── Info.plist # Reference environment variables
├── Literature.txt # Articles references
├── MediaPicker.swift # Picker to select a medium among a catalog
├── MediaViewerApp.swift # Contain the 2D scene (sidebar and content) and the immersive space
├── Models # Data models
│ ├── ApiResponse.swift # Strapi API response wrapper
│ ├── Area.swift # Enumeration of the available areas/scenes
│ ├── AreaState.swift # Define which area is currently displayed
│ ├── EarthModel.swift # Info to display on the attachment next to the earth model
│ ├── IdentifiableObject.swift # Protocol to make an object identifiable
│ ├── ImmersiveState.swift # Define wether the immersive space is displayed or not
│ ├── Localization.swift # Model of a locale fetched from the CMS
│ ├── MediaState.swift # Define which medium is currently displayed, and store the query parameters to search for media
│ ├── Medium.swift # Model of a medium fetched from the CMS
│ ├── Reader.swift # Model of a reader fetched from the CMS
│ ├── ReaderMedium.swift # Link between a reader and a medium (is the medium read by the reader? is the medium archived by the reader?)
│ ├── RichTextType.swift # Model of a rich text block fetched from the CMS
│ ├── StrapiDate.swift # Model to encode/decode dates from the CMS
│ ├── StrapiImage.swift # Model to read images from the CMS
├── Services # Call the CMS API
│ ├── Api.swift # Abstraction layer to send REST requests to the CMS
│ ├── MediumService.swift # Fetch media from the CMS
│ └── ReaderMediumService.swift # Fetch the link between a reader and a medium from the CMS
├── Utils # Utility functions
│ ├── Array.swift # Add safe subscript to arrays
│ └── KeyedDecodingContainer.swift # decode objects from the cms in a safe way
├── Views
│ ├── RichTextView.swift # Display a recursive rich text block
│ ├── EarthView.swift # Display a 3D earth with an attachment
│ ├── ImageTemplateView.swift # Display an image
│ ├── ImmersiveView.swift # Display a texture on a 3D sphere around the user
│ ├── LocationDialogView.swift # Dialog that displays location info
│ ├── TextTemplateView.swift # Display a text
│ ├── ThreeDEntity.swift # Display a 3D model in a 3D reality view
│ ├── ThreeDTemplateView.swift # Display a 3D model in a 2D scene view
└──── VideoTemplateView.swift # Display a video
```
