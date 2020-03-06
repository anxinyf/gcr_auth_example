# Search gcr.io images via curl

First:

`gcloud config set account [ACCOUNT_NAME]`

See more: https://cloud.google.com/sdk/gcloud/reference/config/set

Second:
`

gcloud auth list

TOKEN=$(gcloud auth print-access-token)

curl --header "Authorization: Bearer $TOKEN" "https://gcr.io/v2/$GCP_PROJECT_ID/$MY_IMAGE/manifests/latest"
`

Or see tags of images
`
curl --header "Authorization: Bearer $TOKEN" "https://gcr.io/v2/$GCP_PROJECT_ID/$MY_IMAGE/tags/list"
`
Note: replace GCP_PROJECT_ID and MY_IMAGE.
