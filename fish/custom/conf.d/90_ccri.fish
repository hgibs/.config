command -v ip >/dev/null 2>&1 || exit 0

ip link show | grep -q enp0s31f6
if test $status -ne 0
    exit 0
end

# if test (ifconfig en0 | grep ether | awk '{print $2}') = "f8:4d:89:69:83:59" 
if test (ip -o link show enp0s31f6 | grep -oE "([a-f0-9]{2}:){5}[a-f0-9]{2}" | head -n 1) = "ac:91:a1:14:29:d5"
    set -g HOST_ENV_SETTING ccri

    set -gx STARSHIP_CONFIG ~/dotfiles/starship.toml

    set -gx GIT_ACCESS_TOKEN_READONLY (cat ~/.secret/git_readonly_personal_token)

    # abbr -e ls # wait for exa to become available

    abbr record_container 'asciinema rec ~/terminal_recording/sessions/(date +%FT%T).asc -c "zellij --layout ~/terminal_recording/recording_stack_layout_container.kdl"'
    abbr record_crush 'asciinema rec ~/terminal_recording/sessions/(date +%FT%T).asc -c "zellij --layout ~/terminal_recording/recording_stack_layout_crusher.kdl"'
    abbr record_cmcc 'asciinema rec ~/terminal_recording/sessions/(date +%FT%T).asc -c "zellij --layout ~/terminal_recording/recording_stack_layout.kdl"'
    abbr record_lib 'asciinema rec ~/terminal_recording/sessions/(date +%FT%T).asc -c "zellij --layout ~/terminal_recording/recording_lib_layout.kdl"'
    abbr mci 'mvn clean install'
    abbr mcv 'mvn clean verify'
    abbr mcis 'mvn clean install -DskipTests'
    abbr mdt 'mvn dependency:tree'
    abbr mdtf 'mvn dependency:tree -DoutputFile=dependencies.txt'
    abbr mst 'mvn -Dmaven.test.skip=true'
    abbr m mvn
    abbr mt 'mvn test'
    abbr mtd 'mvn test -Dmaven.surefire.debug'
    abbr mc 'mvn clean'
    abbr mcd 'mvn clean deploy'
    abbr mcs 'mvn clean site'
    # abbr mv 'mvn verify' # can't do that and still `mv` files!
    abbr msc 'mvn scala:console'
    abbr mep 'mvn help:effective-pom -Dverbose=true -Doutput=effective.xml'
    abbr ml 'mvn fr.jcgay.maven.plugins:buildplan-maven-plugin:list'
    abbr mlp 'mvn -q --also-make exec:exec -Dexec.executable="pwd"' # list all project dirs
    abbr mountnas 'sshfs hgibson@nas0.ccri.com:/mnt/tank $HOME/nas0_tank'
    abbr mountlxc 'sshfs hgibson@hgibson-lxc.ccri.com:/home/hgibson $HOME/lxc'
    abbr vpnclean "ip -j a | jq -r '.[] | select(.ifname | test(\"vpn.*\")) | .ifname' | xargs nmcli connection delete"

    abbr crusher '$HOME/Developer/optix_edge/deployments/crusher'
    abbr cmcc '$HOME/Developer/optix_edge/deployments/cmcc'
    abbr java-utils '$HOME/Developer/optix_edge/java-utils'
    abbr containers '$HOME/Developer/optix_edge/containers'

    # colorful less!
    set -gx LESSOPEN "| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"

    # move asciinema config (which disables automatic uploading)
    set -gx ASCIINEMA_CONFIG_HOME "$HOME/dotfiles/asciinema"

    set -gx MAVEN_OPTS '-Xmx1500M -Xms1G -Duser.timezone=UTC -Xss32m'
    set -gx JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

    fish_add_path --append "$HOME/src/inrev"

    # add coursier to path
    fish_add_path --prepend "$HOME/.local/share/coursier/bin"

    # add pip to path
    fish_add_path --prepend "$HOME/.local/bin"

    # add jdtls to path
    fish_add_path --append "$HOME/Applications/jdtls/bin"

    # add rubygems to path
    fish_add_path --append "$HOME/.local/share/gem/ruby/3.0.0/bin"

    # add spotbugs to end of path
    # set -gxa PATH "$HOME/Developer/spotbugs-utils"
    fish_add_path --global --append "$HOME/Developer/spotbugs-utils"

    #default java
    # set -gx JAVA_HOME "/usr/lib/jvm/java-8-openjdk-amd64"
    set -gx JAVA_HOME "$HOME/jvm/jdk-17.0.2"

    # make sure docker is running
    systemctl --user --quiet is-active docker.service
    if test $status -ne 0
        set_color 0db7ed
        echo "󰡨 Starting docker.service"
        set_color normal
        systemctl --user start docker.service
    end
    set -l docker_preamble "unix://"
    set -l docker_sockpath (find /run/user -name docker.sock 2>/dev/null || true | head -n 1)
    # set -l docker_sockpath "$XDG_RUNTIME_DIR/docker.sock"
    set -gx DOCKER_HOST (string join '' "$docker_preamble" "$docker_sockpath")
    set -a PATH "$JAVA_HOME/bin"

    # add NVM setup
    set -gx NVM_DIR "$HOME/.nvm"

    eval $HOME/miniforge3/bin/conda "shell.fish" hook $argv | source
end
