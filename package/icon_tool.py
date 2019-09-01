# encoding=utf-8
import os

import PIL.Image as Image

from package import manifest_tool

from lxml import etree

import urllib2

import cStringIO


# 修改图标icon
# app_node:AndroidManifest.xml的application节点用于获取icon所在的文件夹和路径
# target_dir:修改完成输出的路径，自动加上res
# public_icon_file:公共icon
# platform_icon_file:当第三方平台需要自定义icon时，使用该icon
# right_icon_file:各平台角标图片
def change_icon(app_node, target_dir, public_icon_file, platform_icon_file, right_icon_file):
    iconContent = app_node.get(manifest_tool.name_space + 'icon')
    iconStrs = iconContent.split('/')
    iconDir = iconStrs[0].replace('@', '')
    iconName = iconStrs[1]
    iconDirs = ['xxxhdpi-v4', 'xxhdpi-v4', 'xhdpi-v4', 'hdpi-v4', 'mdpi-v4', 'ldpi-v4']
    iconSizes = [512, 384, 256, 72, 48, 36]
    iconPath_noPlatform = target_dir + os.path.sep + "res" + os.path.sep + iconDir + "-xxxhdpi-v4" + os.path.sep + iconName + '.png'
    if os.path.exists(platform_icon_file):
        iconPath_noPlatform = platform_icon_file
    else:
        if os.path.exists(public_icon_file):
            iconPath_noPlatform = public_icon_file

    if os.path.exists(iconPath_noPlatform):
        iconImageMax = Image.open(iconPath_noPlatform).convert("RGBA")
        rightBtIcon = Image.open(right_icon_file).convert("RGBA")
        (x1, y1) = rightBtIcon.size
        (x2, y2) = iconImageMax.size
        px = x2 - x1
        py = y2 - y1
        newRb = rightBtIcon.resize((x2, y2), Image.ANTIALIAS)
        iconImageMax.paste(newRb, (0, 0, x2, y2), newRb)
        for j in range(len(iconDirs)):
            temp = iconImageMax.resize((iconSizes[j], iconSizes[j]), Image.ANTIALIAS)
            newDir = target_dir + '/res/' + iconDir + '-' + iconDirs[j]
            if not os.path.exists(newDir):
                os.makedirs(newDir)
            temp.save(newDir + '/' + iconName + '.png', "PNG")
        print '修改icon完成'


def change_plaform_icon(app_node, target_dir, icon_url, right_icon_file):

    iconDirs_no_v4 = ['xxxhdpi', 'xxhdpi', 'xhdpi', 'hdpi', 'mdpi', 'ldpi']
    iconDirs_v4 = ['xxxhdpi-v4', 'xxhdpi-v4', 'xhdpi-v4', 'hdpi-v4', 'mdpi-v4', 'ldpi-v4']

    iconDirs = iconDirs_no_v4
    for i in range(len(iconDirs_v4)):
        if os.path.exists(target_dir + '/res/' + iconDirs_v4[i]):
            iconDirs = iconDirs_v4
            break
    iconContent = app_node.get(manifest_tool.name_space + 'icon')
    iconStrs = iconContent.split('/')
    iconDir = iconStrs[0].replace('@', '')
    iconName = iconStrs[1]
    iconSizes = [512, 384, 256, 72, 48, 36]
    if 'http://' in icon_url:
        try:
            icon_file = cStringIO.StringIO(urllib2.urlopen(icon_url).read())
        except Exception:
            print '打开网络图片失败'
            # 打开图片失败，使用项目已有icon
            icon_file = target_dir + '/res/' + iconDir + '-xxxhdpi-v4/' + iconName + '.png'
            if not os.path.exists(icon_file):
                icon_file = target_dir + '/res/' + iconDir + '-xxxhdpi/' + iconName + '.png'
    else:
        if not os.path.exists(icon_url):
            icon_file = target_dir + '/res/' + iconDir + '-xxxhdpi-v4/' + iconName + '.png'
            if not os.path.exists(icon_file):
                icon_file = target_dir + '/res/' + iconDir + '-xxxhdpi/' + iconName + '.png'
        else:
            icon_file = icon_url
    iconImageMax = Image.open(icon_file).convert("RGBA")
    (x2, y2) = iconImageMax.size
    # px = x2 - x1
    # py = y2 - y1
    if os.path.exists(right_icon_file):
         rightBtIcon = Image.open(right_icon_file).convert("RGBA")
         (x1, y1) = rightBtIcon.size
         newRb = rightBtIcon.resize((x2, y2), Image.ANTIALIAS)
         iconImageMax.paste(newRb, (0, 0, x2, y2), newRb)
    for j in range(len(iconDirs)):
        temp = iconImageMax.resize((iconSizes[j], iconSizes[j]), Image.ANTIALIAS)
        newDir = target_dir + '/res/' + iconDir + '-' + iconDirs[j]
        newDir1 = target_dir + '/res/' + iconDir + '-' + iconDirs_v4[j]
        if not os.path.exists(newDir):
            os.makedirs(newDir)
        if not os.path.exists(newDir1):
            os.makedirs(newDir1)
        temp.save(newDir + '/' + iconName + '.png', "PNG")
        temp.save(newDir1 + '/' + iconName + '.png', "PNG")
    print '修改icon完成'


def change_icon(app_node, target_dir, icon_file):
    iconContent = app_node.get(manifest_tool.name_space + 'icon')
    iconStrs = iconContent.split('/')
    iconDir = iconStrs[0].replace('@', '')
    iconName = iconStrs[1]
    iconDirs = ['xxxhdpi', 'xxhdpi', 'xhdpi', 'hdpi', 'mdpi', 'ldpi']
    iconSizes = [512, 384, 256, 72, 48, 36]
    # iconPath_noPlatform = target_dir + os.path.sep + "res" + os.path.sep + iconDir + "-xxxhdpi-v4" + os.path.sep + iconName + '.png'
    if os.path.exists(icon_file):
        iconImageMax = Image.open(icon_file)
        for j in range(len(iconDirs)):
            temp = iconImageMax.resize((iconSizes[j], iconSizes[j]), Image.ANTIALIAS)
            newDir = target_dir + '/res/' + iconDir + '-' + iconDirs[j]
            if not os.path.exists(newDir):
                os.makedirs(newDir)
            temp.save(newDir + '/' + iconName + '.png', "PNG")
        print '修改icon完成'
    else:
        print "no"


def change_icon_url(app_node, target_dir, icon_url):
    iconContent = app_node.get(manifest_tool.name_space + 'icon')
    iconStrs = iconContent.split('/')
    iconDir = iconStrs[0].replace('@', '')
    iconName = iconStrs[1]
    iconDirs = ['xxxhdpi', 'xxhdpi', 'xhdpi', 'hdpi', 'mdpi', 'ldpi']
    iconSizes = [512, 384, 256, 72, 48, 36]
    icon_file = cStringIO.StringIO(urllib2.urlopen(icon_url).read())
    iconImageMax = Image.open(icon_file)
    for j in range(len(iconDirs)):
        temp = iconImageMax.resize((iconSizes[j], iconSizes[j]), Image.ANTIALIAS)
        newDir = target_dir + '/res/' + iconDir + '-' + iconDirs[j]
        if not os.path.exists(newDir):
            os.makedirs(newDir)
        temp.save(newDir + '/' + iconName + '.png', "PNG")
    print '修改icon完成'


def change_icon_manifest(manifest_path, target_dir, public_icon_file, platform_icon_file, right_icon_file):
    if not os.path.exists(right_icon_file):
        print "下标icon文件不存在，请注意！"
        return
    android_tree = etree.parse(manifest_path)
    appNode = android_tree.xpath('/manifest/application')[0]
    change_icon(appNode, target_dir, public_icon_file, platform_icon_file, right_icon_file)
