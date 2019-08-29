# encoding=utf8
import os

from lxml import etree

name_space = '{http://schemas.android.com/apk/res/android}'
manifest_file_name = 'AndroidManifest.xml'
android_name = name_space + 'name'


def insert_nope(android_nodes, platform_nodes, insert_parent):
    for i in range(len(platform_nodes)):
        node_name_p = platform_nodes[i].get(android_name)
        if len(android_nodes) == 0:
            insert_parent.append(platform_nodes[i])
        else:
            for j in range(len(android_nodes)):
                node_name = android_nodes[j].get(android_name)
                if (node_name_p == node_name):
                    break
                if (node_name_p != node_name) and (j == (len(android_nodes) - 1)):
                    insert_parent.append(platform_nodes[i])

def get_manifest_tree(android_manifest_path):
    if not os.path.exists(android_manifest_path):
        return False
    return etree.parse(android_manifest_path)


def merge_manifest(android_tree, platform_manifest):
    android_root = android_tree.xpath('//manifest')[0]
    app_node = android_tree.xpath('//application')[0]
    platform_tree = etree.parse(platform_manifest)
    # android_root.set('package', package_name)
    # android_root.set(name_space + 'versionCode', version_code)
    # android_root.set(name_space + 'versionName', version_name)
    # 权限
    android_permissions = android_tree.xpath('//uses-permission')
    platform_permissions = platform_tree.xpath('//uses-permission')
    # android n 权限
    android_N_permissions = android_tree.xpath('//permission')
    platform_N_permissions = platform_tree.xpath('//permission')
    # activity
    android_activitys = android_tree.xpath('//activity')
    platform_activitys = platform_tree.xpath('//activity')
    # service
    android_services = android_tree.xpath('//service')
    platform_services = platform_tree.xpath('//service')
    # receiver
    android_receivers = android_tree.xpath('//receiver')
    platform_receivers = platform_tree.xpath('//receiver')
    # provider
    android_providers = android_tree.xpath('//provider')
    platform_providers = platform_tree.xpath('//provider')
    # meta-data
    android_meta_datas = android_tree.xpath('/manifest/application/meta-data')
    platform_meta_datas = platform_tree.xpath('/manifest/meta-data')
    android_uses_librarys = android_tree.xpath('//uses-library')
    platform_uses_librarys = platform_tree.xpath('//uses-library')
    android_supports_screens = android_tree.xpath('/manifest/supports-screens')
    platform_supports_screens = platform_tree.xpath('/manifest/supports-screens')

    android_uses_feature = android_tree.xpath('/manifest/uses-feature')
    platform_uses_feature = platform_tree.xpath('/manifest/uses-feature')

    insert_nope(android_permissions, platform_permissions, android_root)
    insert_nope(android_N_permissions, platform_N_permissions, android_root)
    insert_nope(android_activitys, platform_activitys, app_node)
    insert_nope(android_services, platform_services, app_node)
    insert_nope(android_receivers, platform_receivers, app_node)
    insert_nope(android_providers, platform_providers, app_node)
    insert_nope(android_meta_datas, platform_meta_datas, app_node)
    insert_nope(android_uses_librarys, platform_uses_librarys, app_node)
    insert_nope(android_supports_screens,platform_supports_screens,android_root)
    insert_nope(android_uses_feature ,platform_uses_feature,android_root)
    print "合并清单文件完成"
    return android_tree,


def change_package_name(android_tree, package_name):
    android_root = android_tree.xpath('//manifest')[0]
    android_root.set('package', package_name)


def change_version_code(android_tree, version_code):
    android_root = android_tree.xpath('//manifest')[0]
    android_root.set(name_space + 'versionCode', version_code)


def change_version_name(android_tree, version_name):
    android_root = android_tree.xpath('//manifest')[0]
    android_root.set(name_space + 'versionName', version_name)


def create_node(tag, property_map, content):
    '''新造一个节点
      tag:节点标签
      property_map:属性及属性值map
      content: 节点闭合标签里的文本内容
      return 新节点'''
    element = etree.Element(tag)
    for (k, v) in property_map.items():
        element.set(name_space + k, v)
    return element


if __name__ == '__main__':
    manifest_file = '../SdkRes/sdk/bilibili/SdkManifest.xml'
    manifest_tree = get_manifest_tree(manifest_file)
    if not manifest_tree:
        print '文件不存在'
    else:
        platform_meta_datas = manifest_tree.xpath('/manifest/uses-feature')
        for i in range(len(platform_meta_datas)):
            print platform_meta_datas[i].get(android_name)

