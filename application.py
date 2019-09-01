# coding=utf-8
import os
import sys

from package import smali_tool
from package import apk_tool
from package import file_tool
from package import manifest_tool
from package import config_tool

reload(sys)

# 生成渠道编译文件配置
# step1 完成渠道对接
# step2 按照csdk模式放置文件
# step3 编写SdkManifest.xml文件,里面包含渠道sdk要求的Manifest文件配置
# step4 将渠道sdk的jar生成smali文件
# step5 将渠道接入类生成smali文件


# 日常打包配置
# step1 cp对接好msdk之后，将包传过来，
# step2 设置各渠道参数，还有包名，icon，角标，版本号，签名方式
# step3 开始打包

# 打包流程细节
# 接收到包和参数
# 使用apktool将包解压
# 根据参数生成MSdkConfig.properties文件
# 配置manifest文件，将配置好SdkManifest.xml合并到AndroidManifest.xml，并修改报名，版本号，版本名
# 对渠道特定的Manifest配置进行修改
# 渠道文件下面的文件和并到解压目录，除文件，access，jarlibs，tmp这几个文件不需要合并
# 使用apktool将解压出来的目录进行打包成apk
# 然后对apk进行签名

# 预先生成smali流程，将jar和对接类转换成smali
sdk_dir = './resource/resource_sdk/'


def test(manifest_tree, csdk_config):
    appId_metaMatch = "/manifest/application/meta-data[@android:name='csdkGameId']"
    meta_node = \
        manifest_tree.xpath(appId_metaMatch, namespaces={'android': 'http://schemas.android.com/apk/res/android'})[0]
    meta_node.set(manifest_tool.name_space + 'value', 'csdkGameId=' + csdk_config['channelGameId'])


if __name__ == '__main__':
    # smali_tool.create_channel_smali('csdk')
    # smali_tool.create_channel_access_class('csdk')
    # smali_tool.create_channel_access_smali('csdk')

    msdk_config = {'gameId': '1', 'channelId': '2', 'channelName': 'ChannelCSdk', 'channelClass': 'channel',
                   'host': 'http://xxx.xxxgame.com'}

    csdk_config = {'channelGameId': '1b3m7d9g'}

    # 需要指定一个工作目录
    work_dir = ''

    # 使用apktool将包解压
    package_name = ''
    version_code = ''
    version_name = ''
    # apk_tool.decode('/Users/chenjingyuan/Desktop/release/app-release.apk',
    #                 '/Users/chenjingyuan/Desktop/csdk/')

    # 根据参数配置并生成MSdkConfig.properties
    config_tool.create_msdk_config('/Users/chenjingyuan/Desktop/csdk/assets/MSdkConfig.properties', msdk_config,
                                   csdk_config)

    # 配置manifest文件，将配置好SdkManifest.xml合并到AndroidManifest.xml，并修改报名，版本号，版本名
    manifest_file = '/Users/chenjingyuan/Desktop/csdk/' + manifest_tool.manifest_file_name
    manifest_tree = manifest_tool.get_manifest_tree(manifest_file)
    platform_manifest_file = sdk_dir + 'csdk' + os.path.sep + 'SdkManifest.xml'
    # TODO 合并manifest文件，将SdkRes/sdk/ysdk/SdkManifest.xml
    manifest_tool.merge_manifest(manifest_tree, platform_manifest_file)
    # TODO 修改packageName，versionCode,versionName
    manifest_tool.change_package_name(manifest_tree, package_name)
    manifest_tool.change_version_code(manifest_tree, version_code)
    manifest_tool.change_version_name(manifest_tree, version_name)

    # 对渠道特定的Manifest配置进行修改
    manifest_tool.config_channel_manifest_config(manifest_tree, csdk_config, test)

    # 生成渠道角标


    # 写入文件
    manifest_tree.write(manifest_file, encoding="utf-8")

    # 渠道文件下面的文件和并到解压目录，除文件，access，jarlibs，tmp这几个文件不需要合并
    file_tool.merge_file(sdk_dir + os.path.sep + 'csdk', '/Users/chenjingyuan/Desktop/csdk/')

    # 使用apktool将解压出来的目录进行打包成apk
    # apk_tool.encode('/Users/chenjingyuan/Desktop/csdk',
    #                 '/Users/chenjingyuan/Desktop/csdk/dist/')
