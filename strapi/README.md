Strapi is a headless CMS that allows you to create, manage and distribute content across any platform.

# How to configure

Copy '.env.prod.example' to '.env.prod' and fill in the required fields:

- Generate random hex strings for (e.g. using `openssl rand -hex 32`):
  - APP_KEYS (enter two comma-separated strings)
  - API_TOKEN_SALT
  - ADMIN_JWT-SECRET
  - TRANSFER_TOKEN_SALT
  - JWT_SECRET
- To connect to the database, modify the db password DATABASE_PASSWORD
- To host images, we use AWS S3. Fill in the required fields:
  - AWS_ACCESS_KEY_ID
  - AWS_SECRET_ACCESS_KEY
  - AWS_REGION
  - AWS_BUCKET
  - AWS_URL

# How to run

```bash
yarn dev
yarn build && yarn start
```

Go to the [web interface](http://localhost:1337/admin) to create the admin user, or use the following command:

```bash
yarn strapi admin:reset-user-password --email="YOUR_EMAIL" --password="YOUR_NEW_PASSWORD"
```

# How to deploy

```bash
docker build -t pheonbest/cloud:awt-media-viewer-cms --platform linux/amd64 .

sudo APP_VERSION=3.0 docker-compose -f docker-compose.prod.yml build
sudo docker push pheonbest/cloud:awt-strapi-3.0
sudo docker push pheonbest/cloud:awt-strapi-latest
```

# How to use

The content of each page is defined using a rich text editor. It supports:

- text
- images
- videos
- 3D models
- links
- lists (ordered and unordered)

The images, videos and 3D models are submitted as links.

### Displaying a video

To display a video, the served content-type must be `video/mp4`. Here is how to do it using wistia:

1. Upload the video to https://wistia.com/
2. Click on uploaded video
3. On the left side, click Download
4. Next to 1080p, right click the downlaod icon and click Copy link address
5. In the cms (https://awt-strapi.antoninmarxer.com/admin), go to Content Manager and select a page
6. Add a link:
   - text: [embedded-video]
   - url: copied url

### Displaying a 3D model

To display a 3D model, the served content-type must be `application/octet-stream`. Here is how to do it using google drive:

1. Upload the 3D model to https://drive.google.com/
2. Right click the uploaded file and click Get link
3. Click on Copy link
4. From the link, extract the file id (the part after `https://drive.google.com/file/d/` and before `/view?usp=sharing`)
5. In the cms (https://awt-strapi.antoninmarxer.com/admin), go to Content Manager and select a page
6. Add a link:
   - text:
     - if the filetype is .usda: [embedded-model][.usda]
     - else: [embedded-model]
   - url: `https://drive.google.com/uc?export=download&id=FILE_ID`

### Displaying an image

To display an image, the served content-type must be `image/png` or `image/jpeg`. Here is how to do it using google drive:

1. Upload the image to https://drive.google.com/
2. Right click the uploaded file and click Get link
3. Click on Copy link
4. From the link, extract the file id (the part after `https://drive.google.com/file/d/` and before `/view?usp=sharing`)
5. In the cms (https://awt-strapi.antoninmarxer.com/admin), go to Content Manager and select a page
6. Add a link:
   - text: [embedded-image]
   - url: `https://drive.google.com/uc?export=download&id=FILE_ID`
