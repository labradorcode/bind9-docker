pipeline {
    agent {
       label 'docker-multiarch' 
    }
    environment {
        DOCKER_REPOSITORY_NAME = "labradorcode"
        DOCKER_CREDENTIALS = credentials('github-labradorcode-credentials')
        DOCKER_IMAGE_NAME = 'bind9'
        DOCKER_IMAGE_TAG = '9.18.3-r2'
    }
    stages {
        stage('Init') {
            steps {
                echo 'Initializing..'
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                echo "Current branch: ${env.BRANCH_NAME}"
                sh('echo $DOCKER_CREDENTIALS_PSW | docker login -u $DOCKER_CREDENTIALS_USR --password-stdin')
            }
        }
        stage('Set docker building context') {
            steps {
                echo 'Using builder as buildx context'
                sh "docker buildx use builder"
            }
        }
        stage('Build') {
            steps {
                echo 'Building image..'
                sh "docker buildx build --platform linux/amd64,linux/arm64,linux/386,linux/ppc64le,linux/s390x,linux/arm/v7,linux/arm/v6 --pull --no-cache --push -t ${DOCKER_REPOSITORY_NAME}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ."
            }
        }

        stage('Build latest tag') {
            steps {
                echo 'Building image..'
                sh "docker buildx build --platform linux/amd64,linux/arm64,linux/386,linux/ppc64le,linux/s390x,linux/arm/v7,linux/arm/v6 --pull --no-cache --push -t ${DOCKER_REPOSITORY_NAME}/${DOCKER_IMAGE_NAME}:latest ."
            }
        }


    }
}
