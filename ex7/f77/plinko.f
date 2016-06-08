      program plinko

      implicit none
      integer levels
      parameter ( levels=9 )

      integer max, drop, i, pos,
     +        count(levels+1)
      double precision rnum

      write(6,*) 'Number of drops?'
      read(5,*) max

c     set all counts to zero
      do 10 i=1,levels+1
        count(i) = 0
 10   continue

      do 20 drop=1,max
        pos = levels
        do 30 i=1,levels
          if (rand().lt.0.5) then
            pos = pos - 1
          else
            pos = pos + 1
          endif
 30     continue
        count(pos/2+1) = count(pos/2+1) + 1
 20   continue

c     write out final results
      write(6,*) 'Statistics:'
      do 40 i=1,levels+1
        write(6,99) i, count(i)
 40   continue
 99   format('Bucket ',i5,': ',i5)

      end
