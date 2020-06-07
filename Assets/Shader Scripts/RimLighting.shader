Shader "Custom/RimLighting"
{
	Properties
	{
		_RimColor("Rim Color", Color) = (0,0.5,0.5,0)
		_RimPower("Rim Power", Range(0.5,8)) = 2.0
		_texture("Albedo Texture",2D) = "white" {}
		_stripeSize("Stripe size", Range(0.1,100)) = 10
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
			float3 viewDir;
			float3 worldPos;
			float2 uv_texture;
        };

		float4 _RimColor;
		float _RimPower;
		sampler2D _texture;
		float _stripeSize;

        void surf (Input IN, inout SurfaceOutput o)
        {
			half rim = 1-saturate(dot(normalize(IN.viewDir), o.Normal));
			//o.Emission = _RimColor.rgb * pow(rim, _RimPower); //Gradient rim colour
			//o.Emission = _RimColor.rgb * rim>0.5?float3(1,0,0):0; //Set inner line to red.
			//o.Emission = rim > 0.5 ? float3(1, 0, 0) : rim > 0.3 ? float3(0, 1, 0) : 0; // green and red rim.
			//o.Emission = IN.worldPos.y > 1 ? float3(0, 1, 0) : float3(1, 0, 0); //If world pos y is over 1 then green, else red.
			//o.Emission = frac(IN.worldPos.y * 10 * 0.5) > 0.4 ? float3(0, 1, 0) : float3(1, 0, 0);//Christmas 
			o.Emission = frac(IN.worldPos.y * _stripeSize * 0.5) > 0.4 ? float3(0, 1, 0)*rim : float3(1, 0, 0)*rim;
			o.Albedo = tex2D(_texture, IN.uv_texture).rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
