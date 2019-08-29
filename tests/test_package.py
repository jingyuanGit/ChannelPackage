# coding=utf-8
import sys
import unittest
import package

from package import smali_tool
from package import apk_tool

reload(sys)

# class PackageTest(unittest.TestCase):
#
#     def test_apk_decode(self):
#
#         apk_tool.decode('/Users/jkyl/Desktop/Projects/Android/MsdkProjects/app/release/app-release.apk',
#                         '/Users/jkyl/Desktop/Projects/test/')
#         print(1)
#
# unittest.main()


if __name__ == '__main__':
    apk_tool.decode('/Users/jkyl/Desktop/Projects/Android/MsdkProjects/app/release/app-release.apk',
                    '/Users/jkyl/Desktop/Projects/test/')