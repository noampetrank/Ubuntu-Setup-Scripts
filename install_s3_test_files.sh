sudo apt install -y awscli
echo "export AWS_ACCESS_KEY_ID=AKIASMHZ4KIOX7Z7MXE5" >> ~/.profile
echo "export AWS_SECRET_ACCESS_KEY=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" >> ~/.profile
source ~/.profile
cd
mkdir test-files-new
cd test-files-new
aws s3 sync s3://buga-resources-test-files .
cd
mv test-files test-files-old
mv test-files-new test-files