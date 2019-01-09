local LeaveTile = {};
function LeaveTile:Create(sClassName)
   local obj = Actor:DeriveClass(sClassName);
   return obj;
end
return LeaveTile;