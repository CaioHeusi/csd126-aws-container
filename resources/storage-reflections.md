# Storage Reflection

## 1) Read about pre-signed S3 URLs. Read the comments in app/flask/photos.py:get_presigned_url. Explain how your app allows users to upload and view photos in your S3 bucket despite the fact that objects in S3 buckets are private by default and you did NOT apply any policies that would override that default.
S3 bucket keeps private because the objects inside S3 are not public, and the app don't open the bucket with public policy. What happens here, is that he create a pre-signed URL, which is temporary link with credentials. That means user will not have free access to entire bucket, it's just to that specific file.

AWS explains that objects inside S3 are private by default, and pre-signed URL provides a limited time access without change bucket policy.

## 2) Read about Global Secondary Indexes.  Explain why the two GSIs you created are useful, and why the specific attributes used for the hash and range keys are the right choices for those GSIs. It may be helpful to read the comments in the upload_photo and toggle_privacy functions in app/flask/photos.py
The two GSIs are useful because the app need to search photos in more than one way. 

user-photos-index -> helps the app find all photos from one user and sort them by upload time.

feed-index -> helps the app find public photos for the home page and also sort them by upload time.

I think these keys are helpful because they match what the app needs to do. One index is for a user’s own photos, and the other is for the public feed.