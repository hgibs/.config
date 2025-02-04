function render-mmd -a filename output -d "Render a .mmd file"
    docker run --rm --platform linux/amd64 --user root -v "$PWD":/data ghcr.io/mermaid-js/mermaid-cli/mermaid-cli:latest --width 1920 --height 1080 --backgroundColor "#2A303C" --theme dark --input "$filename" --outputFormat "$output"
end
