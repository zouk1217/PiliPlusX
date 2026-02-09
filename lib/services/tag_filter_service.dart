// tag_filter_service.dart

class TagFilterService {
    List<String> _blockedTags = [];

    // Add a tag to the block list
    void blockTag(String tag) {
        if (!_blockedTags.contains(tag)) {
            _blockedTags.add(tag);
        }
    }

    // Remove a tag from the block list
    void unblockTag(String tag) {
        _blockedTags.remove(tag);
    }

    // Check if a tag is blocked
    bool isTagBlocked(String tag) {
        return _blockedTags.contains(tag);
    }

    // Retrieve the list of blocked tags
    List<String> getBlockedTags() {
        return _blockedTags;
    }
}