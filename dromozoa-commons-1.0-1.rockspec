-- This file was automatically generated for the LuaDist project.

package = "dromozoa-commons"
version = "1.0-1"
-- LuaDist source
source = {
  tag = "1.0-1",
  url = "git://github.com/LuaDist-testing/dromozoa-commons.git"
}
-- Original source
-- source = {
--   url = "https://github.com/dromozoa/dromozoa-commons/archive/v1.0.tar.gz";
--   file = "dromozoa-commons-1.0.tar.gz";
-- }
description = {
  summary = "Reusable Lua components";
  license = "GPL-3";
  homepage = "https://github.com/dromozoa/dromozoa-commons/";
  maintainer = "Tomoyuki Fujimori <moyu@dromozoa.com>";
}
build = {
  type = "builtin";
  modules = {
    ["dromozoa.commons.clone"] = "dromozoa/commons/clone.lua";
  };
}