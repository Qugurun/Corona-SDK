--подключаем require ("shader.shader")
--устанавливаем шейдер SetSpriteShader( shadow, "water0" )

local kernel = {
 isTimeDependent = true,
 category = "filter",
 name = "water0",
 fragment = [[
  P_COLOR vec4 FragmentKernel( P_UV vec2 texCoord )
  {
   P_RANDOM vec4 k=vec4(CoronaTotalTime)*1.0;
   P_DEFAULT mat3 mat = mat3(-2,-1,0, 3,-1,1, 1,-1,-1)*0.4;
   P_COLOR vec4 texture = texture2D( CoronaSampler0, texCoord );
   k.xy = texCoord*6.0;
   k = pow(min(
		min(
		length(0.5-fract(k.xyw*=mat)),
        length(0.5-fract(k.xyw*=mat))
        ),
        length(0.5-fract(k.xyw*=mat)))
        , 8.0)
        *3.0 + texture;
   return CoronaColorScale(k);    
  }
 ]],
}
graphics.defineEffect(kernel)

------------------------------------------------------

local kernel = { category = "filter", name = "water1" }

  kernel.isTimeDependent = true

  kernel.fragment = [[
   P_COLOR vec4 FragmentKernel( P_UV vec2 texCoord )
{

    P_COLOR vec4 texture = texture2D( CoronaSampler0, texCoord );
    P_COLOR float ratio, xOffset, yOffset;
    {
        xOffset = cos( CoronaTotalTime  * -2. + texCoord.y * 0. ) * 0.013 + cos( CoronaTotalTime  * -2.3 + texCoord.y * 5. ) * 0.003;
        yOffset = sin( CoronaTotalTime  * -3. + texCoord.x * 0. ) * 0.013 + sin( CoronaTotalTime  * -2.7 + texCoord.x * 7. ) * 0.003;
        
       texture = texture2D( CoronaSampler0, vec2( texCoord.x + xOffset, texCoord.y + yOffset ) );
    }

    return CoronaColorScale( texture );
}
]]
graphics.defineEffect(kernel)

------------------------------------------------------

local kernel = { category = "filter", name = "water2" }

  kernel.isTimeDependent = true

  kernel.fragment = [[
   P_COLOR vec4 FragmentKernel( P_UV vec2 texCoord )
{

    P_COLOR vec4 texture = texture2D( CoronaSampler0, texCoord );
    P_COLOR float xOffset, yOffset;
    {
        xOffset = cos( CoronaTotalTime  * -2. + texCoord.y * 30. ) * 0.013 + cos( CoronaTotalTime  * -2.3 + texCoord.y * 5. ) * 0.003;
        yOffset = sin( CoronaTotalTime  * -3. + texCoord.x * 20. ) * 0.013 + sin( CoronaTotalTime  * -2.7 + texCoord.x * 7. ) * 0.003;
        
       texture = texture2D( CoronaSampler0, vec2( texCoord.x + xOffset, texCoord.y + yOffset ) );
    }

    return CoronaColorScale( texture );
}
]]
graphics.defineEffect(kernel)

------------------------------------------------------

------------------------------------------------------

local kernel = { category = "filter", name = "water3" }

  kernel.isTimeDependent = true

  kernel.fragment = [[
   P_COLOR vec4 FragmentKernel( P_UV vec2 texCoord )
{

    P_COLOR vec4 texture = texture2D( CoronaSampler0, texCoord );
    P_COLOR float xOffset, yOffset;
    {
        xOffset = cos( CoronaTotalTime  * -3. + texCoord.y * 30. ) * 0.020 + cos( CoronaTotalTime  * -5.3 + texCoord.y * 5. ) * 0.003;
        yOffset = sin( CoronaTotalTime  * -3. + texCoord.x * 10. ) * 0.020 + sin( CoronaTotalTime  * -5.7 + texCoord.x * 7. ) * 0.003;
        
       texture = texture2D( CoronaSampler0, vec2( texCoord.x + xOffset, texCoord.y + yOffset ) );
    }

    return CoronaColorScale( texture );
}
]]
graphics.defineEffect(kernel)

------------------------------------------------------


function SetSpriteShader(id, param )
  if param == "water0" then
    id.fill.effect = "filter.custom.water0"
  elseif  param == "water1" then
     id.fill.effect = "filter.custom.water1"
  elseif  param == "water2" then
     id.fill.effect = "filter.custom.water2"   
   elseif  param == "water3" then
     id.fill.effect = "filter.custom.water3"    
  end 
end