#!/bin/bash
# Docker variables 
LOCAL_IMAGE="nagios"
LOCAL_TAG="4.5.7"
DOCKERHUB_REPO="tedleyem/nagios"
FULL_LOCAL_IMAGE="${LOCAL_IMAGE}:${LOCAL_TAG}"
FULL_REMOTE_IMAGE_TAG="${DOCKERHUB_REPO}:${LOCAL_TAG}"
FULL_REMOTE_IMAGE_LATEST="${DOCKERHUB_REPO}:latest"
 
echo "Starting Docker image sync for: ${FULL_LOCAL_IMAGE}"
echo "Targeting Docker Hub repository: ${DOCKERHUB_REPO}"
echo "Checking for local image: ${FULL_LOCAL_IMAGE}..."
if ! docker image inspect "${FULL_LOCAL_IMAGE}" > /dev/null 2>&1; then
    echo "Error: Local image ${FULL_LOCAL_IMAGE} not found. Exiting."
    exit 1
fi
echo "Local image found."

# 2. Authenticate to Docker Hub (important for pushing)
echo "Please log in to Docker Hub if you haven't already..."
docker login

# 3. Tag the image with the specific version
echo "Tagging image as ${FULL_REMOTE_IMAGE_TAG}..."
if ! docker tag "${FULL_LOCAL_IMAGE}" "${FULL_REMOTE_IMAGE_TAG}"; then
    echo "Error: Failed to tag image. Exiting."
    exit 1
fi

# 4. Tag the image as latest
echo "Tagging image as ${FULL_REMOTE_IMAGE_LATEST}..."
if ! docker tag "${FULL_LOCAL_IMAGE}" "${FULL_REMOTE_IMAGE_LATEST}"; then
    echo "Error: Failed to tag 'latest' image. Exiting."
    exit 1
fi

# 5. Push the specific version tag
echo "Pushing image: ${FULL_REMOTE_IMAGE_TAG}..."
if ! docker push "${FULL_REMOTE_IMAGE_TAG}"; then
    echo "Error: Failed to push ${FULL_REMOTE_IMAGE_TAG}. Exiting."
    exit 1
fi

# 6. Push the latest tag
echo "Pushing image: ${FULL_REMOTE_IMAGE_LATEST}..."
if ! docker push "${FULL_REMOTE_IMAGE_LATEST}"; then
    echo "Error: Failed to push ${FULL_REMOTE_IMAGE_LATEST}. Exiting."
    exit 1
fi

echo "---"
echo "Docker image sync complete!"
echo "The image ${FULL_LOCAL_IMAGE} has been successfully pushed to Docker Hub as:"
echo "  - ${FULL_REMOTE_IMAGE_TAG}"
echo "  - ${FULL_REMOTE_IMAGE_LATEST}"