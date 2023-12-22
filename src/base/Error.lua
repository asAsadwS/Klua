--[[
Klua is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

Klua is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with Klua. If not, see <https://www.gnu.org/licenses/>.
--]]

assert(loadfile("base/Object.lua","t"),"Loading error")();

Error = Object.clone();

Error.logs = {format = "%s\n", filter = 0, out = io.stdout};
local MetaErrorLogs = {
	__call = function(self)
		return function(level,...)
			local info = string.format(self.format,...);
			if (level == 1) then
				level = "[ERROR]:";
			elseif (level == 2) then
				level = "[WARN]:";
			elseif (level == 3) then
				level = "[INFO]";
			else
				level = "";
			end
			info = level .. info
			self.out:write(info);
		end
	end,
}

setmetatable(Error.logs,MetaErrorLogs);

print();
