function npm
    if set --query NVM_DIR
        if test (nvm current) = "system"
            nvm use node
        end
    end

    command npm $argv
end
