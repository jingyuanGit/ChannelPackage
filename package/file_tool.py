#!/usr/bin/env python
# coding=utf-8
import os
import urllib2


# 下载文件
def down_file(url, save_path):
    print url
    print save_path
    u = urllib2.urlopen(url)
    f = open(save_path, 'wb')
    meta = u.info()
    file_size = int(meta.getheaders("Content-Length")[0])
    file_size_dl = 0
    block_sz = 8192
    while True:
        buffer = u.read(block_sz)
        if not buffer:
            break
        file_size_dl += len(buffer)
        f.write(buffer)
    f.close()


# 复制文件函数，如果没有文件就会自动创建
def copyFiles(sourceDir, targetDir):
    for file in os.listdir(sourceDir):
        sourceFile = os.path.join(sourceDir, file)
        targetFile = os.path.join(targetDir, file)
        if os.path.isfile(sourceFile):
            if not os.path.exists(targetDir):
                os.makedirs(targetDir)
            if not os.path.exists(targetFile) or (
                    os.path.exists(targetFile) and (os.path.getsize(targetFile) != os.path.getsize(sourceFile))):
                open(targetFile, "wb").write(open(sourceFile, "rb").read())
        if os.path.isdir(sourceFile):
            First_Directory = False
            copyFiles(sourceFile, targetFile)


def merge_file(sourceDir, targetDir):
    if not os.path.exists(sourceDir):
        return
    for file in os.listdir(sourceDir):
        name = os.path.join(sourceDir, file)
        if os.path.isdir(name):
            dirName = os.path.basename(file)
            if dirName != 'access' and dirName != 'jarlibs' and dirName != 'tmp':
                targetFile = os.path.join(targetDir, dirName)
                copyFiles(name, targetFile)
    print '合并文件完成'
