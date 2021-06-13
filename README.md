<!-- After running below command delete .git directory created by it rm -r .git -->
npx create-react-app client

<!-- If you deleted kubernetes then make sure to run below command on fresh Kubernetes: -->

kubectl create secret generic pgpassword --from-literal PGPASSWORD=pgpassword