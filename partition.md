<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

Partitions
==========

      Name     Flags    Part Type   FS Type            [Label]       Size (MB)
    ---------------------------------------------------------------------------
      sda1     Boot      Primary    Linux ext3         [fs_root]       4096,00
      sda5               Logical    Linux ext3         [fs_usr]       13312,00
      sda6               Logical    Linux swap / Solaris               6144,00
      sda7               Logical    Linux ext3         [fs_var]        7168,00
      sda8               Logical    Linux ext3         [fs_home]      10240,00
                         Logical    Free Space                       512000,00
