import 'package:get/get.dart';
import 'package:piliplusx/utils/storage.dart'; // 假设这是项目的存储工具类

class TagBlockManager {
  static const String _key = 'blocked_tags_list';
  
  // 使用 GetX 的 RxList 实现响应式，由于设置页可能需要实时更新
  static final RxList<String> blockedTags = <String>[].obs;

  // 初始化（在 main.dart 或 App 启动时调用）
  static void init() {
    final List<dynamic>? stored = Storage.getList(_key); // 根据实际 Storage API 调整
    if (stored != null) {
      blockedTags.addAll(stored.cast<String>());
    }
  }

  // 添加屏蔽标签
  static void addTag(String tag) {
    if (tag.isNotEmpty && !blockedTags.contains(tag)) {
      blockedTags.add(tag);
      _save();
    }
  }

  // 移除屏蔽标签
  static void removeTag(String tag) {
    blockedTags.remove(tag);
    _save();
  }

  // 检查是否包含屏蔽标签
  static bool isBlocked(List<String>? videoTags) {
    if (videoTags == null || videoTags.isEmpty || blockedTags.isEmpty) {
      return false;
    }
    // 取交集，如果有交集则说明命中屏蔽词
    return videoTags.any((tag) => blockedTags.contains(tag));
  }

  static void _save() {
    Storage.setList(_key, blockedTags.toList()); // 根据实际 Storage API 调整
  }
}
