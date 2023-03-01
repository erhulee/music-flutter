import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:notions_todo/api/netease.dart';

Future getSongList(String keyword) async {
  return NetEase.search(keyword);
}
