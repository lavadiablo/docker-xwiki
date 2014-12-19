

# start docker process
sudo docker run --name $1 -p 5432:5432 -e POSTGRES_PASSWORD=$2 -v $3:/var/lib/postgresql/data -d postgres 
