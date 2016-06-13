import os
VersionFile = open("xwikiVersion.html","r")


latest = ""
for line in VersionFile:
    if line.find("<span class=\"download-version fill-LTS\">") != -1:
        latest = line[line.index("<span class=\"download-version fill-LTS\">") + len("<span class=\"download-version fill-LTS\">"):line.index("</span>",line.index("<span class=\"download-version fill-LTS\">"))]

print 'wget "http://download.forge.ow2.org/xwiki/xwiki-enterprise-web-' + latest + '.war" -P /'
print 'unzip "/xwiki-enterprise-web-' + latest + '.war" -d /var/lib/tomcat7/webapps/xwiki'
