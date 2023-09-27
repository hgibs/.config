#!/usr/bin/fish

mkdir -p $HOME/bin

# install scala
command -vq cs
if test ! $status -eq 0
    cd "$HOME/bin" || exit 1
    curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup
end

command -vq metals
if test ! $status -eq 0
    cs install metals
end

# need to replace with ansible line_in_file plugin
# command -vq jdtls
# if test ! $status -eq 0
#     set -l jdtls_temp (mkdtemp -d jdtls_XXXXX)
#     cd $jdtls_temp
#     # install openjdk 20
#     # curl -L "https://download.java.net/java/GA/jdk20.0.2/6e380f22cbe7469fa75fb448bd903d8e/9/GPL/openjdk-20.0.2_linux-x64_bin.tar.gz" | tar -xz
#     sudo apt install -y openjdk-17-jdk

#     # https://github.com/eruizc-dev/jdtls-launcher
#     curl https://raw.githubusercontent.com/eruizc-dev/jdtls-launcher/master/install.sh | bash
    
#    # printf '%s\n%s\n' "export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64" 
#     mv $HOME/.local/bin/jdtls $HOME/.local/bin/jdtls-tmp
#     echo "export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64" > $HOME/.local/bin/jdtls
#     cat $HOME/.local/bin/jdtls-tmp >> $HOME/.local/bin/jdtls
#     chmod +x $HOME/.local/bin/jdtls

#     rm $HOME/.local/bin/jdtls-tmp
    
#     cd $HOME/bin
#     rm -rf $jdtls_temp
# end

npm i -g vscode-langservers-extracted

command -vq lemminx
if test ! $status -eq 0
    cd (mktemp -d lemminx_XXXX) || exit 1
    # install graal - requires jdk17
    set -lx JAVA_HOME "/usr/lib/jvm/java-17-openjdk-amd64"
    curl -L "https://download.oracle.com/graalvm/17/latest/graalvm-jdk-17_linux-x64_bin.tar.gz" | tar -xz
    cd graalvm*
    cd bin
    # fish_add_path -a (pwd)
    set -gx PATH (pwd) $PATH
    cd ../..
    gu install native-imxage
    
    git clone https://github.com/eclipse/lemminx.git
    cd lemminx
    ./mvnw clean package -Dnative -DskipTests


    # copy the org.xyz to bin
    # docker run -v (pwd):/app --rm ghcr.io/graalvm/jdk-community:20.0.1-ol9 bash
end