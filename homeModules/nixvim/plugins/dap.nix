{pkgs, ...}: {
  programs.nixvim = {
    plugins.dap = {
      enable = true;
    };

    plugins.dap-ui = {
      enable = true;
    };
    keymaps = [
      {
        key = "<Leader>du";
        mode = "n";
        action.__raw = "function() require('dapui').toggle() end";
        options = {
          desc = "DAP-UI: Toggle UI";
        };
      }
      {
        key = "<Leader>de";
        mode = "n";
        action.__raw = "function() require('dapui').eval() end";
        options = {
          desc = "DAP-UI: Eval";
        };
      }
      {
        key = "<F5>";
        mode = "n";
        action.__raw = "function() require('dap').continue() end";
        options = {
          desc = "DAP: Continue";
        };
      }
      {
        key = "<F10>";
        mode = "n";
        action.__raw = "function() require('dap').step_over() end";
        options = {
          desc = "DAP: Step Over";
        };
      }
      {
        key = "<F11>";
        mode = "n";
        action.__raw = "function() require('dap').step_into() end";
        options = {
          desc = "DAP: Step Into";
        };
      }
      {
        key = "<F12>";
        mode = "n";
        action.__raw = "function() require('dap').step_out() end";
        options = {
          desc = "DAP: Step Out";
        };
      }
      {
        key = "<Leader>b";
        mode = "n";
        action.__raw = "function() require('dap').toggle_breakpoint() end";
        options = {
          desc = "DAP: Toggle [b]reakpoint";
        };
      }
      {
        key = "<Leader>B";
        mode = "n";
        action.__raw = "function() require('dap').set_breakpoint() end";
        options = {
          desc = "DAP: Set [B]reakpoint";
        };
      }
      {
        key = "<Leader>lp";
        mode = "n";
        action.__raw = " function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end";
        options = {
          desc = "DAP: Set [L]og[p]oint";
        };
      }
      {
        key = "<Leader>dr";
        mode = "n";
        action.__raw = "function() require('dap').repl.open() end";
        options = {
          desc = "DAP: Open [r]epl";
        };
      }
      {
        key = "<Leader>dl";
        mode = "n";
        action.__raw = "function() require('dap').run_last() end";
        options = {
          desc = "DAP: Run [l]ast";
        };
      }
      {
        key = "<Leader>dh";
        mode = ["n" "v"];
        action.__raw = "function() require('dap.ui.widgets').hover() end";
        options = {
          desc = "DAP: hover";
        };
      }
      {
        key = "<Leader>dp";
        mode = ["n" "v"];
        action.__raw = "function() require('dap.ui.widgets').preview() end";
        options = {
          desc = "DAP: preview";
        };
      }
      {
        key = "<Leader>df";
        mode = "n";
        action.__raw = "function() 
          local widgets = require('dap.ui.widgets')
          widgets.centered_float(widgets.frames) end";
        options = {
          desc = "DAP: frames";
        };
      }
      {
        key = "<Leader>ds";
        mode = "n";
        action.__raw = "function() 
          local widgets = require('dap.ui.widgets')
          widgets.centered_float(widgets.scopes) end";
        options = {
          desc = "DAP: scopes";
        };
      }
    ];
  };
}
