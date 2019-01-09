local EnterTile = {};
function EnterTile:Create(sClassName)
   local obj = Actor:DeriveClass(sClassName);
   return obj;
end
return EnterTile;