-- Copyright (C) 2015 Tomoyuki Fujimori <moyu@dromozoa.com>
--
-- This file is part of dromozoa-commons.
--
-- dromozoa-commons is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- dromozoa-commons is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with dromozoa-commons.  If not, see <http://www.gnu.org/licenses/>.

local equal = require "dromozoa.commons.equal"
local keys = require "dromozoa.commons.keys"

local data = keys({
  foo = 17;
  bar = 23;
  baz = 37;
}):sort()
assert(equal(data, { "bar", "baz", "foo" }))

local data = keys({ "foo", "bar", "baz" }):sort()
assert(equal(data, { 1, 2, 3 }))
