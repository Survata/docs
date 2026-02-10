# Mintlify docs site commands

# Start local dev server
dev port="3000":
    mint dev --port {{port}}

# Check for broken links
check-links:
    mint broken-links

# Update Mintlify CLI
update:
    npm i -g mint

# Validate docs.json is valid JSON
validate:
    python3 -c "import json; json.load(open('docs.json')); print('docs.json is valid')"
