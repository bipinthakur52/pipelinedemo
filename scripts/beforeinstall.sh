#!/bin/bash

# Retrieve the branch name from the CodeBuild environment variable
BRANCH_NAME=$(echo $CODEBUILD_SOURCE_VERSION | awk -F "/" '{print $3}')

# Use the branch name in your script
echo "The branch name is: $BRANCH_NAME"

# Additional commands using the branch name
