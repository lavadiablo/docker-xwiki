import re
import os
file = open("xwikiDownloadPage.html","r")

latest = ""
for line in file:
    if re.search('xwiki-enterprise-web-([0-9].)+war',line):
        latest =  line

xwikiPackage = re.search('xwiki-enterprise-web-([0-9].)+war',latest).group(0)

print 'wget "http://download.forge.ow2.org/xwiki/'+ xwikiPackage + '" -P /'
print 'unzip "/' + xwikiPackage + '" -d /var/lib/tomcat7/webapps/xwiki'
