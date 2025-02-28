function yarn
    if set --query NVM_DIR
        if test (nvm current) = "system"
            nvm use node
        end
    end

    command yarn $argv
end
