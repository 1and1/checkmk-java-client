#! /bin/bash

echo "Changing pom.xml"
PROFILES=$(cat << EOF
       <profile>
            <id>sonatype-oss-snapshot</id>
            <distributionManagement>
                <snapshotRepository>
                    <id>sonatype</id>
                    <url>https://oss.sonatype.org/content/repositories/snapshots</url>
                </snapshotRepository>
            </distributionManagement>
        </profile>
        <profile>
            <id>github</id>
            <distributionManagement>
                <repository>
                    <id>github</id>
                    <name>GitHub Packages</name>
                    <url>https://maven.pkg.github.com/sfuhrm/checkmk-java-client</url>
                </repository>
            </distributionManagement>
        </profile>
        <profile>
            <id>sonatype-oss-release</id>
            <distributionManagement>
                <repository>
                    <id>sonatype</id>
                    <name>Central Repository OSSRH</name>
                    <url>https://oss.sonatype.org/service/local/staging/deploy/maven2/</url>
                </repository>
            </distributionManagement>            
            <build>
                <plugins>
                    <plugin>
                        <groupId>org.apache.maven.plugins</groupId>
                        <artifactId>maven-gpg-plugin</artifactId>
                        <version>3.0.1</version>
                        <configuration>
                        <keyname>0AC5A45E91FA93DA25380017B0D87B063EAD41F1</keyname>
                        </configuration>
                        <executions>
                            <execution>
                                <id>sign-artifacts</id>
                                <phase>verify</phase>
                                <goals>
                                    <goal>sign</goal>
                                </goals>
                            </execution>
                        </executions>
                    </plugin>
                    <plugin>
                        <groupId>org.apache.maven.plugins</groupId>
                        <artifactId>maven-surefire-plugin</artifactId>
                        <configuration>
                            <skip>true</skip>
                        </configuration>
                    </plugin>
                    <plugin>
                        <groupId>org.apache.maven.plugins</groupId>
                        <artifactId>maven-failsafe-plugin</artifactId>
                        <configuration>
                            <skip>true</skip>
                        </configuration>
                    </plugin>
                </plugins>
            </build>
        </profile>
EOF
)

# update license and some dependency versions
cat pom.xml |
xmlstarlet edit -N "pom=http://maven.apache.org/POM/4.0.0" \
  --update "/pom:project/pom:licenses/pom:license/pom:name" --value "GNU General Public License, Version 2" \
  --update "/pom:project/pom:licenses/pom:license/pom:url" --value "https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt" \
  --update "/pom:project/pom:properties/pom:okhttp-version" --value "4.12.0" \
  --update "/pom:project/pom:properties/pom:gson-version" --value "2.10.1" \
  --update "/pom:project/pom:properties/pom:jackson-databind-nullable-version" --value "0.2.6" \
  --update "/pom:project/pom:properties/pom:commons-lang3-version" --value "3.13.0" \
  | \
awk -v PROFILES="$PROFILES" > pom.xml.new '
/<\/profiles>/ { print PROFILES; }
{ print $0; q}
' && mv pom.xml.new pom.xml
