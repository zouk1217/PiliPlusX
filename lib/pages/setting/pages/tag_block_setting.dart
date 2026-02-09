import 'package:flutter/material.dart';
import 'package:get/get.dart';
// 引入上面创建的 TagBlockManager

class TagBlockSettingPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  TagBlockSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('屏蔽视频标签')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: '输入要屏蔽的标签',
                      border: OutlineInputBorder(),
                      hintText: '例如：综艺、明星等',
                    ),
                    onSubmitted: (val) => _addTag(),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _addTag,
                  child: const Text('添加'),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: Obx(() { // 监听 blockedTags 变化
              if (TagBlockManager.blockedTags.isEmpty) {
                return const Center(child: Text('暂无屏蔽标签'));
              }
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: TagBlockManager.blockedTags.map((tag) {
                      return InputChip(
                        label: Text(tag),
                        onDeleted: () => TagBlockManager.removeTag(tag),
                        deleteIcon: const Icon(Icons.close, size: 18),
                      );
                    }).toList(),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  void _addTag() {
    if (_controller.text.trim().isNotEmpty) {
      TagBlockManager.addTag(_controller.text.trim());
      _controller.clear();
    }
  }
}
