# bootcamp_spring

## Requirements

- Docker must be installed on the host machine.

## Setup Project

Perform the following steps on the Dev Container.

```bash
mvn archetype:generate -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-webapp -DarchetypeVersion=1.5

# https://maven.apache.org/archetypes/maven-archetype-webapp/
```

|property|value|
|--|--|
|groupId|example|
|artifactId|firstapp|
|version|[none]|
|package|example.firstapp|

```
Define value for property 'groupId': example
Define value for property 'artifactId': firstapp
Define value for property 'version' 1.0-SNAPSHOT: 
Define value for property 'package' example: example.firstapp
Confirm properties configuration:
groupId: example
artifactId: firstapp
version: 1.0-SNAPSHOT
package: example.firstapp
 Y: y
[INFO] ----------------------------------------------------------------------------
[INFO] Using following parameters for creating project from Archetype: maven-archetype-webapp:1.5
[INFO] ----------------------------------------------------------------------------
[INFO] Parameter: groupId, Value: example
[INFO] Parameter: artifactId, Value: firstapp
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[INFO] Parameter: package, Value: example.firstapp
[INFO] Parameter: packageInPathFormat, Value: example/firstapp
[INFO] Parameter: package, Value: example.firstapp
[INFO] Parameter: groupId, Value: example
[INFO] Parameter: artifactId, Value: firstapp
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[WARNING] CP Don't override file /workspaces/bootcamp_spring/firstapp/src/main/webapp
[WARNING] CP Don't override file /workspaces/bootcamp_spring/firstapp/.mvn
[INFO] Project created from Archetype in dir: /workspaces/bootcamp_spring/firstapp
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:15 min
[INFO] Finished at: 2025-06-07T09:50:41Z
[INFO] ------------------------------------------------------------------------
```

![Congratulations!!](doc/setup1.png)

## Update Project

```bash
cd firstapp
mvn clean install
```

If the project build is successful, the `target` directory is created.

## Build & Deploy Project

```bash
docker-compose up --build
# stop with ctrl+C 
```

Access http://localhost:8080

![sample-top](doc/sample-top.png)


## Note

### Maven version

> [!NOTE]
> This event is a note as of 20252/06/07.

The latest version fails to install, so a fixed version is installed.
The installation is done using devcontainers Features.

```json
	"features": {
    	"ghcr.io/devcontainers/features/java:1": {
			"installMaven": true,
			"mavenVersion": "3.8.6"
		}
	},
```

<details>
<summary>Remote container error log</summary>

```
######################################################################## 100.0%
19.93
19.93 Repackaging Java 24.0.1-tem...
35.23
35.23 Done repackaging...
37.80
37.80 Installing: java 24.0.1-tem
40.56 Done installing!
40.56
40.56
40.56 Setting java 24.0.1-tem as default.
41.46 4 archive(s) flushed, freeing 137M        /usr/local/sdkman/tmp.
41.48 1 archive(s) flushed, freeing 8.0K        /usr/local/sdkman/var/metadata.
42.11 0 archive(s) flushed, freeing 4.0K        /usr/local/sdkman/tmp.
44.08
44.08 Downloading: maven 3.9.9
44.08
44.08 In progress...
44.08
44.29 #=#=#
######################################################################## 100.0%
45.37
45.37 Stop! The archive was corrupt and has been removed! Please try installing
again.
45.38 ERROR: Feature "Java (via SDKMAN!)" (ghcr.io/devcontainers/features/java)
failed to install! Look at the documentation at https://github.com/devcontainers
/features/tree/main/src/java for help troubleshooting this error.
------
ERROR: failed to solve: process "/bin/sh -c cp -ar /tmp/build-features-src/java_
0 /tmp/dev-container-features  && chmod -R 0755 /tmp/dev-container-features/java
_0  && cd /tmp/dev-container-features/java_0  && chmod +x ./devcontainer-feature
s-install.sh  && ./devcontainer-features-install.sh  && rm -rf /tmp/dev-containe
r-features/java_0" did not complete successfully: exit code: 1
```

</details>

