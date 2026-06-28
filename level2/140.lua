local ok = type(utf8) == "table" and isreadonly(utf8) and utf8.charpattern == "[\0-\x7F\xC2-\xF4][\x80-\xBF]*"
print(ok and "ok" or "dtc")