Shader "Custom/BlendTest"{
	Properties{
		_MainTex("Texture", 2D) = "black" {}
	}

	SubShader{
		Tags {"Queue" = "Transparent"}
		Pass {
			Blend DstColor Zero
			SetTexture [_MainTex] {combine texture}
		}
	}
}