1. Clone the project
```bash
git clone https://github.com/zeroturnaround/petclinic.git
cd petclinic
```

2. Build application artifact
```bash
mvn clean package
```

3. Build a new Docker image based on the Dockerfile
```bash
docker build -t waspet .
```

4. Run the application
```bash
docker run -d -p 9043:9043 -p 9443:9443 -v `pwd`:/tmp/petclinic -v ~/.jrebel:/home/was/.jrebel waspet
```
It takes a while for the application server to start. Follow the logs to track the status:
```bash
docker logs --follow <container id>
```
Once the application server has started, you will see the following message in the log:

>   WSVR0001I: Server server1 open for e-business

The application is now accessible at ```https://localhost:9443/petclinic```

5. Now you can open the project in your beloved IDE, make changes to the code and see JRebel reloading the app on-the-fly


NB! The path in rebel.xml must match the directory that was mapped via command line (/tmp/petclinic)




