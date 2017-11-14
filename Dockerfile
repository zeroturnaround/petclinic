FROM ibmcom/websphere-traditional:profile
COPY ["jrebel-7.1.2","/tmp/jrebel"]
RUN wsadmin.sh -lang jython -conntype NONE -c "AdminConfig.modify(AdminConfig.list('JavaVirtualMachine', AdminConfig.list('Server')), [['genericJvmArguments', '-Xshareclasses:none -agentpath:/tmp/jrebel/lib/libjrebel64.so']])"
COPY target/petclinic.war /tmp/petclinic.war
RUN wsadmin.sh -lang jython -conntype NONE -c "AdminApp.install('/tmp/petclinic.war', '[ -appname petclinic -contextroot /petclinic -MapWebModToVH [[ petclinic petclinic.war,WEB-INF/web.xml default_host]]]')"

#docker build -t waspet .
#docker run -d -p 9043:9043 -p 9443:9443 -v /Users/anton/work-src/petclinic:/tmp/petclinic -v /Users/anton/.jrebel:/home/was/.jrebel waspet