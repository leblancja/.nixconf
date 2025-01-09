{  config, pkgs, lib, ... }: 

{
  home = {
  

  

	
	


	


  programs.vscode = {
	enable = true;
	extensions = with pkgs.vscode-extensions; [
		ms-dotnettools.vscode-dotnet-runtime
		ms-dotnettools.csharp
		ms-dotnettools.csdevkit
		ms-dotnettools.vscodeintellicode-csharp
		humao.rest-client
		svelte.svelte-vscode
		bbenoist.nix
		yzhang.markdown-all-in-one
		elixir-lsp.vscode-elixir-ls
		esbenp.prettier-vscode
		ms-azuretools.vscode-docker
		dbaeumer.vscode-eslint
		zainchen.json
		bradgashler.htmltagwrap
		github.copilot
		github.vscode-github-actions
		github.vscode-pull-request-github
	];
  };
}
