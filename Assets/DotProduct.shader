Shader "Custom/DotProduct"
{

    SubShader
    {
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert

        struct Input
        {
            float3 viewDir;
        };



        void surf (Input IN, inout SurfaceOutput o)
        {
			half d = dot(IN.viewDir, o.Normal);
			o.Albedo.rgb = float3(0, 1 - d,1);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
