pipeline {
    agent any
         stages{
    
    stage ('git clone') {
            steps {
        echo "code is building"
         git 'https://github.com/mounika8500/food-ubu.git'
            }
        }

        stage ('Bulding docker docker image') {
            steps {
                echo "build docker image"
                sh 'docker build --no-cache -t test1 .'
                sh 'docker tag test1:latest 156739282338.dkr.ecr.ap-south-1.amazonaws.com/test1:latest'
            }
        }
        stage ('Uploading to ECR') {
            steps {
                echo "uploading to ECR"
                sh 'docker push 156739282338.dkr.ecr.ap-south-1.amazonaws.com/test1:latest'
            }
        }

        stage ('deploying to EKS') {
           steps {
                echo "deploying imges to EKS"
                sh 'kubectl apply -f test-dep.yaml'
                sh 'kubectl set image deployment/food-master food=156739282338.dkr.ecr.ap-south-1.amazonaws.com/test1:latest -n jaan'
                sh 'kubectl apply -f test-svc.yaml'
                sh 'kubectl rollout restart deployment/food-master'
                sh 'docker rmi -f $(docker images --filter "dangling=true" -q --no-trunc)'
               
           }
    }  
        
}

}
