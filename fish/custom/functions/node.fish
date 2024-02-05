function node
    if set --query NVM_DIR
        if test (nvm current) = "system"
            nvm use node
        end
    end

    command node $argv
end
