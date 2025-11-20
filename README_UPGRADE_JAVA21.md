Upgrade guide — Java 21 (LTS)

This project is a simple Java source tree without a build tool. The automated Copilot upgrade tools require a Pro/Enterprise plan and are not available in this environment, so these manual steps will help you upgrade to JDK 21 and verify the project.

1) Install JDK 21
- Windows (recommended):
  - Option A (winget):
    1. Open PowerShell as Administrator
    2. Run: `winget search temurin` to find the exact package id
    3. Install Temurin 21 (example): `winget install --id Eclipse.Adoptium.Temurin.21 -e` (verify the id from the search results first)
  - Option B (installer): Download the Windows MSI for Temurin (Eclipse Adoptium) or Oracle JDK 21 and run the installer.

2) Verify installation (PowerShell):
```powershell
java -version
javac -version
```
You should see `version "21` in the output.

3) Set JAVA_HOME for the current PowerShell session (replace the path with your JDK 21 installation):
```powershell
$env:JAVA_HOME = 'C:\Program Files\Eclipse Adoptium\jdk-21'
$env:Path = $env:JAVA_HOME + '\\bin;' + $env:Path
java -version
```

4) Compile and run the project (single-file example)
- From the repository root:
```powershell
javac Hello.java
java Hello
```

5) If you later add Maven or Gradle, update the Java settings:
- Maven (pom.xml):
  - Use the maven-compiler-plugin or set `maven.compiler.release` to 21:
    <properties>
      <maven.compiler.release>21</maven.compiler.release>
    </properties>
- Gradle (build.gradle):
  - For legacy style:
    java {
      sourceCompatibility = JavaVersion.VERSION_21
      targetCompatibility = JavaVersion.VERSION_21
    }
  - Recommended: use Java toolchains to request JDK 21 during build.

6) If you want me to run automated code upgrades (OpenRewrite / Copilot upgrade tools), note that those tools require a Pro/Enterprise Copilot plan. If you have access, I can run them with your permission.

Notes:
- This repo currently only contains `Hello.java` so there's no build file to modify. The main task is ensuring your system JDK is updated to Java 21 and your build tool (if added) is configured to target 21.
