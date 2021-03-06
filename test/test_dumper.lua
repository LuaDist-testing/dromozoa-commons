-- Copyright (C) 2015,2017 Tomoyuki Fujimori <moyu@dromozoa.com>
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
local linked_hash_table = require "dromozoa.commons.linked_hash_table"
local sequence = require "dromozoa.commons.sequence"
local sequence = require "dromozoa.commons.sequence"
local dumper = require "dromozoa.commons.dumper"
local dumper_writer = require "dromozoa.commons.dumper_writer"

assert(dumper.encode("foo\0bar"):match([[^"foo\0+bar"$]]))
assert(dumper.encode(42) == [[42]])

local t = linked_hash_table()
t.foo = sequence():push(17, 23, 37, 42)
t.bar = true
t.baz = "qux"
t[42] = false
t["foo bar"] = "baz qux"
t._ = 42
local result = dumper.encode(t)
-- print(result)
assert(result == [[{foo={17,23,37,42},bar=true,baz="qux",[42]=false,["foo bar"]="baz qux",_=42}]])
assert(equal(dumper.decode(result), t))
-- print(dumper.encode(t, { stable = true }))
assert(result == dumper.encode(t, { stable = true }))

local t = {
  foo = { 17, 23, 37, 42 };
  ["foo bar"] = 0.25;
  [true] = "foo";
  bar = { 42 };
  baz = { baz = false };
  qux = {};
  [1] = { { {} } };
  [2] = { foo = { bar = { baz = "qux" } } };
  [function () end] = "ignore";
}

local result1 = dumper.encode(t)
local result2 = dumper.encode(t, { pretty = true })
local result3 = dumper.encode(t, { stable = true })
local result4 = dumper.encode(t, { pretty = true, stable = true })
-- print(result1)
-- print(result2)
-- print(result3)
-- print(result4)
assert(equal(dumper.decode(result1), dumper.decode(result2)))
assert(equal(dumper.decode(result1), dumper.decode(result3)))
assert(equal(dumper.decode(result1), dumper.decode(result4)))
assert(result3 == [[{["foo bar"]=0.25,[1]={{{}}},[2]={foo={bar={baz="qux"}}},[true]="foo",bar={42},baz={baz=false},foo={17,23,37,42},qux={}}]])
