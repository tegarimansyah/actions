current_tag=$(git describe --abbrev=0 --tags | grep "hybrid")
version=$(echo "$current_tag" | grep -oP '\d+\.\d+\.\d+') # Extract the numeric part (e.g., 0.0.5)
new_version=$(echo "$version" | awk -F. '{$3=$3+1;OFS=".";print $1,$2,$3}') # Increment the minor version (assumes a format like x.y.z)

# Create the new tag
new_tag="$new_version-hybrid"

# Create a new lightweight tag
git tag "$new_tag"

# Output the new tag
echo "Previous tag: $current_tag"
echo "New tag: $new_tag"
