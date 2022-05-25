function set_vars()
  tile_size=8
  d_op={[0]=1,0,3,2}

  pl={
    w=6,
    h=8,
    min_x=0,
    min_y=0,
    max_x=120,
    max_y=128,
    sp=1,
    anim=0,
    spd=1,
  }

  game={
    cam={},
    gravity=0.2,
    frames={
      count=0,
      refresh=30 --30 = 1sec
    },
    scr={
      active="credits",
      credits={
        cam={
          x=64,
          y=48
        }
      },
      menu={
        cam={
          x=80,
          y=48
        },
        anims={
          btn=0
        }
      },
      over={
        cam={
          x=0,
          y=96
        }
      },
      win={
        cam={
          x=112,
          y=48
        }
      }
    }
  }
  
  lvls={
    {
      name="hello world",
      cam={
        x=0,
        y=0
      },
      pl={
        flpx=true,
        switch=2,
      },
      ego={
        axe="x"
      }
    },
    {
    name="promenade",                                                                                                                                                                                                                       
      cam={
        x=16,
        y=0
      },
      pl={
        flpx=false,
        switch=2,
      },
      ego={
        axe="x"
      }
    },
    {
      name="broken bridge",
      cam={
        x=32,
        y=0
      },
      pl={
        flpx=false,
        switch=0,
      },
      ego={
        axe="x"
      }
    },
    {
      name="phantom pixels",
      cam={
        x=48,
        y=0
      },
      pl={
        flpx=false,
        switch=3,
      },
      ego={
        axe="x"
      }
    },
    {
      name="another phantom",
      cam={
        x=64,
        y=0
      },
      pl={
        flpx=false,
        switch=4,
      },
      ego={
        axe="y"
      }
    },
    {
      name="skulls lair",
      cam={
        x=80,
        y=0
      },
      pl={
        flpx=false,
        switch=2,
      },
      ego={
        axe="x"
      }
    },
    {
      name="abracadabra",
      cam={
        x=96,
        y=0
      },
      pl={
        flpx=false,
        switch=2,
      },
      ego={
        axe="x"
      }
    },
    {
      name="vertical illusion",
      cam={
        x=112,
        y=0
      },
      pl={
        flpx=false,
        switch=8,
      },
      ego={
        axe="y"
      }
    },
    {
      name="mirrors",
      cam={
        x=112,
        y=16
      },
      pl={
        flpx=false,
        switch=2,
      },
      ego={
        axe="x"
      }
    },
    {
      name="16 pixels",
      cam={
        x=96,
        y=16
      },
      pl={
        flpx=false,
        switch=4,
      },
      ego={
        axe="x"
      }
    },
    {
      name="perfect reflect",
      cam={
        x=80,
        y=16
      },
      pl={
        flpx=false,
        switch=2,
      },
      ego={
        axe="x"
      }
    },
    {
      name="iceland",
      cam={
        x=64,
        y=16
      },
      pl={
        flpx=false,
        switch=3,
      },
      ego={
        axe="x"
      }
    },
    {
      name="midnight",
      cam={
        x=48,
        y=16
      },
      pl={
        flpx=false,
        switch=2,
      },
      ego={
        axe="x"
      }
    },
    {
      name="lonely skull",
      cam={
        x=32,
        y=16
      },
      pl={
        flpx=false,
        switch=2,
      },
      ego={
        axe="x"
      }
    },
    {
      name="made in heaven",
      cam={
        x=16,
        y=16
      },
      pl={
        flpx=false,
        switch=5,
      },
      ego={
        axe="y"
      }
    },
    {
      name="underwater",
      cam={
        x=0,
        y=16
      },
      pl={
        flpx=false,
        switch=2,
      },
      ego={
        axe="x"
      }
    },
    {
      name="zupapixels",
      cam={
        x=48,
        y=32
      },
      pl={
        flpx=false,
        switch=9,
      },
      ego={
        axe="x"
      }
    }
  }
 end