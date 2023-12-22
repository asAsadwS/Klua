--[[
Klua is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

Klua is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with Klua. If not, see <https://www.gnu.org/licenses/>.
--]]

Object = {};

Object.FuncClone = function (Table)
	local Source = Table;
	return function ()
		local Cloned = {};
		for i , j in pairs(Table) do
			Cloned[i] = j;
		end
		setmetatable(Cloned,{__index = function(T,K)
					local M = Object.FuncClone(Cloned);
					if (K == "clone") then
						return M;
					else
						return rawget(T,K);
					end
				end
				});
		return Cloned;
	end
end


local MetaTable = {
	__index = function (Table, Key)
		if (Key == "clone") then
			return rawget(Object,"FuncClone")(Table);
		end
	end,
};

MetaTable["__newindex"] = function (T,K,V) assert(false,"Object can't be changed.") end
Object = debug.setmetatable(Object,MetaTable);
