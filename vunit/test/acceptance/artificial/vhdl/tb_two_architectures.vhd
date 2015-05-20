-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this file,
-- You can obtain one at http://mozilla.org/MPL/2.0/.
--
-- Copyright (c) 2014-2015, Lars Asplund lars.anders.asplund@gmail.com

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_two_architectures is
  generic (runner_cfg : runner_cfg_t);
end entity;

architecture pass of tb_two_architectures is
begin
  test_runner : process
  begin
    test_runner_setup(runner, runner_cfg);
    test_runner_cleanup(runner);
    wait;
  end process;
end architecture;

architecture fail of tb_two_architectures is
begin
  test_runner : process
  begin
    test_runner_setup(runner, runner_cfg);
    assert false;
    test_runner_cleanup(runner);
    wait;
  end process;
end architecture;