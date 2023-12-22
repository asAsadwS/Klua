--[[
Klua is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

Klua is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with Klua. If not, see <https://www.gnu.org/licenses/>.
--]]

assert(loadfile("base/Object.lua","t"),"[ERROR]:Object.lua:Loading error")();
assert(loadfile("base/Error.lua","t"),"[ERROR]:Error:Loading error")();

local err = Error.clone();
local log = err.logs();

local function loadErr (file,info)
	tFile = loadfile(file, "t");
	if (type(tFile) == "nil") then
		log(1,info .. ":" .. file);
	else
		tFile();
	end
end

loadErr("base/Net.lua","Net");
loadErr("base/BigNumber.lua","BigNumber");
