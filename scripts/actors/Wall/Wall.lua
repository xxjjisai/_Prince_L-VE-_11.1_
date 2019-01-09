local Wall = {};
function Wall:Create(sClassName)
   local obj = Actor:DeriveClass(sClassName);
   return obj;
end
return Wall;